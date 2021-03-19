# Truffleproject

## Installer Truffle
```
npm install -g truffle
```
Démarrer le projet Truffle
```
truffle init
```
Si besoin, on peut également choisir la versioon du compiler dans le fichier *truffle-config.js* qui se crée à l'initialisation du projet Truffle.


## Fonctions ERC20

Importation de la librairie OpenZeppelin, donnant une implémentation de contrats pouvant être utilisés pour construire des tokens ERC20 (entre autres), avec la commande:\
```
npm install @openzeppelin/contracts
```


## Contrat de token ERC20

Création du fichier *MyToken.sol* dans le dossier 'contracts'.

```
contract ERC20Basic is IERC20 {
    string public constant name = "Mytoken";
    string public constant symbol = "MYTOK";
    uint8 public constant decimals = 14;
    [...]
}
```
Nom, symbole et decimal du token.

```
constructor(uint256 total) public {
    totalSupply_ = total;
    balances[msg.sender] = totalSupply_;
    }
```
Total supply donnée au token.

## Fontion getToken()

```
function getToken(address delegate, address owner, address buyer, uint256 numTokens)  public returns (bool) {
        if (approve(delegate, numTokens)) {
            transferFrom(owner, buyer, numTokens);
        }
        emit getToken(delegate, owner, buyer, numTokens);
        return true;
}
```
L'échange de token ETH se fait en utilisant les fonctions approve et transferFrom (qui ont été override lors de la création du contrat).


## Utiliser Ganache

Installer Ganache
```
npm install --save-dev ganache-cli
npx ganache-cli --deterministic --db
```

Ouvrir un autre terminal et exécuter pour migrer le contrat vers Ganache
```
npx truffle migrate --network development
```

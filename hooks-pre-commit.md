## Mise en place du hook pre-commit

### 1

explorer le dossier .git/hooks (il faut s'assurer qu'on est bien positionner sur le projet front à la racine)

```
$ cd .git/hooks && ls
```

### 2
changer l'extension du pre-commit

```
$ mv pre-commit.sample pre-commit
```

### 3

ajout du droit d'execution

```
$ chmod +x pre-commit
```


### 4
création d'un dossier hooks contenant un ficher qui pre-commit. 

```
$ cd .. && cd .. && mkdir hooks && cd hooks && touch pre-commit
```

### 5 ajout du contenu au nouveau fichier pre-commit
le contenu peut être du bash, du python du php.
example: 
```
#!/bin/sh

exec 1>&2
if npm run build-prod; then
    if npm run test; then
        echo  >&2 "Built and tested successfully"
        exit 0
    else
        echo  >&2 "Test failed"
        exit 1
    fi
else
    echo  >&2 "Build failed"
    exit 1
fi
```
### 6
ajouter le droit d'execution au nouveau fichier
```
$ chmod +x pre-commit 
```
### 7
création du lien symbloique

```
$ cd .. && ln -s -f ../../hooks/pre-commit .git/hooks/pre-commit
```

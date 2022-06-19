---
author: "Manu Martin"
title: "Crear mejores commits"
date: "2022-01-29"

description: "Como escribir mejores commits"
categories:
    - Git
tags:
    - Git
  
image: "cherry-pick.png"
---
Comencé a escribir este post, ya que me causo curiosidad el hecho que haya gente que use herramientas como gitmoji para darle más semántica a sus commits.

A partir de ahí vi que la gente ha sentado unas convenciones para escribir mejores commits.Esto ayuda para la visibilidad de los equipos al leer los commits de otros compañeros que trabajan en la misma base de código. Por otra parte, estos estándares pueden ayudar en muchos más entornos, para crear changelogs de la aplicación automaticamente y en la parte de integración, ya que al estandarizar podemos automatizar recursos que se activen en un momento específico de del desarrollo, haré más incapie en este tema en las descripciones de cada convención.


## Easy one
```
<type>(optional scope): <description>

[optional body]

[optional footer]
```
Las convenciones más sencillas de seguir y las que recomendaría para equipos pequeños o side-projects sería la de [conventional commits](https://www.conventionalcommits.org).
Se basa en el uso de 'fix:', 'feat' y 'BREAKING CHANGE' o '!', para discernir entre los tipos de tu commit. Como describía antes al asentar un estándar podemos crear automatizaciones en nuestros flujos dependiendo del tipo de commit, en este caso podríamos hacer una integración en la cual se aumentara la versión de la release dependiendo del tipo.

Otros tipos son bienvenidos, pero para controlar que cada programador comience a usar su creatividad será mejor definirlos en el fichero de 'CONTRIBUTING.md' o usar un lintr como [commitlint](https://github.com/conventional-changelog/commitlint).

```
build - Build related changes
chore - Build process or auxiliary tool changes
docs - Documentation only changes
feat - A new feature
fix - A bug fix
perf - A code change that improves performance
refactor - A code change that neither fixes a bug or adds a feature
revert - Reverting things
style - Markup, white-space, formatting, missing semi-colons...
test - Adding missing tests
```

Otra cosa que nos puede ayudar cuando no está claro en el cuerpo del commit, en que parte del código estamos trabajando, es el empleo del ámbito(_scope_).


```
fix(clients): syntax error, added semicolon
```

- **Fix**: Se usaría para corregir un fallo en la base de código y esto comportaría en nuestra integración con el cambio de release 'PATCH'.

```bash
# 0.0.1 -> 0.0.2
fix: syntax error, added semicolon
```

- **Feat**: Este cambio añadiría cambios a nuestra base de código y dependerá de sí esta cambia el funcionamiento de la aplicación que la combinaremos con un 'BREAKING CHANGE' o una '!'.

```bash
# 0.3.1 -> 0.4.0 Minor
feat: added some logic to do something

# 0.3.1 -> 1.0.0 Major
feat!: added some logic removed support for ...
```
## El más caótico

Este método para estandarizar tus commits es el culpable de que esté escribiendo esto, ya que llama mucho la atención. Comencé a ver algunos repositorios donde se añadían emojis seguidos de la descripción, al principio creí que solo era un método para hacer más fashion nuestros commits, pero tirado por la curiosidad fui a ver como añadir emojis y descubrí el porqué de todo esto.

Esta convención me parece tan válida como la otra e igual de adaptable a tus necesidades, aunque en algunos casos creo que el uso de emojis se pueda ver de forma clara el objetivo de cada uno como 🐛, 🚑 o ✨; en otros no está tan claro, no olvidemos que en la industria es común tener equipos muy plurales y en diferentes culturas el uso de algunos emojis es totalmente diferente.


## Algunos Tips

Voy a dar algunos de los tips que más he visto en los enlaces que dejo como referencias.

- Usar el verbo imperativo, git usa como estándar el verbo imperativo para lanzar sus comandos y muchos siguen esto para la descripción, definiendo así el estado en el que queremos que este al realizar nuestros cambios.

- Longitud de la descripción y del cuerpo. La longitud de la descripción no debería de pasar de los 50 caracteres y el cuerpo puede extenderse hasta los 72 caracteres.

- Cuando se agregue una descripción es mucho más importante el porqué que el cómo, normalmente los cambios son suficientemente explicativo, pero la razón de porque se llegó hacer de esa forma no.

- Uso de herramientas como [Commitizen](https://github.com/commitizen/cz-cli), [commitlint](https://github.com/conventional-changelog/commitlint) y 'git hooks' nos pueden venir bien a la hora de mejorar en la construcción de nuestros commits.

#### Referencias


- <https://www.conventionalcommits.org>
- <https://gitmoji.dev/>
- <https://cbea.ms/git-commit/>
- <https://midu.dev/buenas-practicas-escribir-commits-git>
- <https://dev.to/helderburato/patterns-for-writing-better-git-commit-messages-4ba0>
- <https://dev.to/wordssaysalot/art-of-writing-a-good-commit-message-56o7>
- <https://github.com/RomuloOliveira/commit-messages-guide>
- <https://github.com/helderburato/dotfiles/blob/main/git/.gittemplates/commit>
- <https://hashnode.com/post/which-commit-message-convention-do-you-use-at-work-ck3e4jbdd00zyo4s1h7mc7e0g>

{{< css.inline >}}
<style>
.canon { background: white; width: 100%; height: auto; }
</style>
{{< /css.inline >}}

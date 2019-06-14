# .emacs.d
My Emacs configuration


### LSP client requirements
* Bash

   Install Bash Language Server, requires `Node.js` and `npm`

   ```bash
   sudo npm i -g bash-language-server --unsafe-perm=true --allow-root
   ```

* Rust

  Install Rust Language Server, assumes `Rust`, `Cargo` and [rustup](https://rustup.rs/) are available

  ```bash
  rustup component add rls rust-analysis rust-src
  ```

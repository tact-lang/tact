contract TestCodeValid {
    receive() {
         let code_self: Cell = codeOf TestCodeValid;
         let unused: Cell = code_self;
    }
}

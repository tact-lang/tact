contract TestSelf {
    receive() {
         let c1 = myCode();
         let c2 = codeOf TestSelf;
         // Using the expressions to avoid unused warnings
         let dummy = c1;
         dummy;
    }
}

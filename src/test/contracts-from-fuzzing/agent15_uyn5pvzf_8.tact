contract SelfCode {
    receive() {
         let c1 = codeOf SelfCode;
         let c2 = myCode();
         // compare cells, though we can't really check equality in Tact, but it's for compilation
    }
}

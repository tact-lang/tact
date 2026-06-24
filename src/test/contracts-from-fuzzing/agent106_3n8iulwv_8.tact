contract SelfCheck {
    receive() {
         let c1 = codeOf SelfCheck;
         let c2 = myCode();
    }
}

contract SelfTestComp {
    receive() {
         let eq: Bool = codeOf SelfTestComp == myCode();
         let _ = eq; // using eq to avoid unused warning
    }
}

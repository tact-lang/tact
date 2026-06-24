contract SelfCodeComp {
    receive() {
        // Compare myCode() and codeOf for the current contract
        let code1 = myCode();
        let code2 = codeOf SelfCodeComp;
        // This equality should hold true
        let _ = code1 == code2;
    }
}

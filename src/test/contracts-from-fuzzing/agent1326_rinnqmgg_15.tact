struct AbsentOpt {
    num: Int = 7;
}

contract UninitOptField {
    missing: AbsentOpt?;

    receive() {
        let _ = self.missing;
    }
}
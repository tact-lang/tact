struct ParamInit {
    v1: Int;
    v2: Bool;
    v3: String;
}

contract ParamTest(s: ParamInit) {
    get fun v1(): Int {
        return self.s.v1;
    }
}
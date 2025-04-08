contract ParamsMix(a: Int, b: Int?, c: Bool?, d: String) {
    get fun a(): Int { return self.a; }
    get fun b(): Int? { return self.b; }
    get fun c(): Bool? { return self.c; }
    get fun d(): String { return self.d; }
}
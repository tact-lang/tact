struct ComplexInner {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract TestContract {
    data: ComplexInner;

    init() {
        self.data = ComplexInner{ a:null, b:true, c:"hello", d:null };
    }
}
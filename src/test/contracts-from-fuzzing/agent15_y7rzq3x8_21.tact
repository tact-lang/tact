struct S1 { a: Int; b: Bool; c: String; d: Int?; e: Bool?; f: String?; }

contract TestContract {
    data: S1;
    data2: S1;

    init() {
        self.data = S1{ a:1, b:true, c:"c", d:null, e:false, f:null };
        self.data2 = S1{ a:2, b:false, c:"cc", d:5, e:true, f:"ff" };
    }
}
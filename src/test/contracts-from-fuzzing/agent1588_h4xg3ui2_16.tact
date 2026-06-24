struct StressFields {
    a: Int; b: Bool; c: String; d: Int?; e: Bool?; f: String?;
    g: Int; h: Bool; i: String; j: Int?; k: Bool?; l: String?;
    m: Int; n: Bool; o: String; p: Int?; q: Bool?; r: String?;
}

contract StressTest {
    s: StressFields;
    
    init() {
        self.s = StressFields{
            a: 1, b: true, c: "a", d: null, e: null, f: null,
            g: 2, h: false, i: "b", j: null, k: null, l: null,
            m: 3, n: true, o: "c", p: null, q: null, r: null,
        };
    }
}
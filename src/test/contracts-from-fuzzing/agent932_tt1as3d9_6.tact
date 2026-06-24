struct SubOpt { x: Int?; y: Bool?; }

struct ComboOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    sub: SubOpt;
}

contract ComboOptionalTest {
    data: ComboOpt;

    init() {
        self.data = ComboOpt{
            a: null,
            b: null,
            c: null,
            sub: SubOpt{ x: null, y: null },
        };
    }
}
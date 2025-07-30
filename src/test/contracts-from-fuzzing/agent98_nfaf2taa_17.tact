struct ManyOptionalStrings {
    a: String?; b: String?; c: String?; d: String?; e: String?;
    f: String?; g: String?; h: String?; i: String?; j: String?;
}

contract OptionalStringContract {
    data: ManyOptionalStrings;

    init() {
        self.data = ManyOptionalStrings{
            a:null, b:null, c:null, d:null, e:null,
            f:null, g:null, h:null, i:null, j:null
        };
    }
}
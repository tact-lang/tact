struct Combine {
    a: Int; b: Bool; c: String; d: Int?; e: String?; f: Bool?;
}

contract ComboFields {
    val: Combine;
    init() {
        self.val = Combine{
            a:1, b:true, c:"abc", d:null, e:null, f:false
        };
    }
}
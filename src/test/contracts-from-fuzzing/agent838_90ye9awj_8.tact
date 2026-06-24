struct MixOptionalAndNonOptional {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String?;
    f: String;
}

contract TestContract {
    mix: MixOptionalAndNonOptional;
    init() {
        self.mix = MixOptionalAndNonOptional{
            a:1, b:null, c:true, d:null, e:null, f:"hello"
        };
    }
}
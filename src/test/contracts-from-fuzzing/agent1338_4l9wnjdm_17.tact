struct MixDefaultsOpt {
    a: Int = 1;
    b: String?;
    c: Bool = true;
    d: String = "test";
    e: Int?;
}

contract DefaultsOptional {
    data: MixDefaultsOpt;

    init() {
        self.data = MixDefaultsOpt{
            b:null,
            e:null
        };
    }
}
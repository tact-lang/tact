struct OptionDefaultMix {
    a: Int?;
    b: Bool?;
    c: Int = 5;
    d: Bool = true;
}

contract OptionDefaultMixContract {
    st: OptionDefaultMix;

    init() {
        self.st = OptionDefaultMix{
            a:null, b:null
        };
    }
}

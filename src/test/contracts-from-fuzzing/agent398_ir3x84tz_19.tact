struct SemiDefault {
    x: Int = 42;
    y: Bool = false;
    s: String = "default";
}

contract PartialOverride {
    sd: SemiDefault;

    init() {
        self.sd = SemiDefault{
            y: true 
        };
    }
}
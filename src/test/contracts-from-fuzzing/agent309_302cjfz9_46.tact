struct DefaultMix {
    foo:Int=5;
    bar:Bool=true;
}
contract DefaultMixTest {
    v:DefaultMix;
    init() {
        self.v = DefaultMix{};
    }
}
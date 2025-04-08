struct W { flag: Bool? }
contract DefaultNullOpt {
    w: W;
    init(){
        self.w = W{};
    }
}
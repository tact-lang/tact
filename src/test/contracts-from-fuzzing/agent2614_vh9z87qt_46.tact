struct DefaultOptMix {
    a:Int=1;
    b:Int?;
}

contract DefaultOptMixContract {
    data: DefaultOptMix;

    init() {
        self.data = DefaultOptMix{
            a:2,
            b:null
        };
    }
}
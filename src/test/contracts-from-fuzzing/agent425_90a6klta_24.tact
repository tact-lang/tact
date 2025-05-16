// test large optional chain
struct DeepOpt {
    d1: Int?;
    d2: Bool?;
    d3: Int?;
    d4: Bool?;
    d5: Int?;
    d6: Bool?;
}

contract TestContract {
    inner: DeepOpt;

    init() {
        self.inner = DeepOpt{
            d1:null, d2:true, d3:null, d4:false, d5:5, d6:null
        };
    }
}
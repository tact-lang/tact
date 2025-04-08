struct InnerMostOpt {
    val: Int;
}

struct NestedOptManyLayers {
    n1: InnerMostOpt?;
    n2: InnerMostOpt?;
    n3: InnerMostOpt?;
}

contract MultiLayerOptional {
    m: NestedOptManyLayers;

    init() {
        self.m = NestedOptManyLayers{
            n1:null,n2:null,n3:null
        };
    }
}

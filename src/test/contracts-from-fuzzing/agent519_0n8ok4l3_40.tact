struct LayerOpt {
    val: Int?;
}

contract LayerOptContract {
    data: LayerOpt;

    init() {
        self.data = LayerOpt{ val: null };
    }
}
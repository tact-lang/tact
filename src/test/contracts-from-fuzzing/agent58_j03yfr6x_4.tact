struct Inner {
    val: Int?;
}

contract TestContract {
    mapData: map<Int, Inner>;

    init() {
        self.mapData = emptyMap();
    }
}
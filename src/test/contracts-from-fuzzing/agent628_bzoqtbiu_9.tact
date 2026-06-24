struct OptionsCluster {
    a: Int?;
    b: Int?;
    flag: Bool?;
    str: String?;
    addr: Address?;
    cellVal: Cell?;
    sliceVal: Slice?;
}

contract OptionClusterStorage {
    cluster: OptionsCluster;

    init() {
        self.cluster = OptionsCluster{
            a: 1,
            b: null,
            flag: true,
            str: "x",
            addr: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            cellVal: cell("te6cckEBAQEAAgAAAEysuc0="),
            sliceVal: slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=")
        };
    }
}
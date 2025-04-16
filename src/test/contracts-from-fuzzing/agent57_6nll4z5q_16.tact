struct Bottom {
    val: Int?;
}
struct Middle {
    nest: Bottom?;
}
contract TopOpt {
    s: Middle?;

    init() {
        self.s = Middle{
            nest: Bottom{
                val: null
            }
        };
    }
}
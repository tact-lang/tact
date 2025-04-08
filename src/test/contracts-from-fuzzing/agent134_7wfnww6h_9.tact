struct ManyOpts {
    f1: Int?;
    f2: Bool?;
    f3: Address?;
    f4: Cell?;
    f5: Builder?;
    f6: Slice?;
    f7: String?;
}

contract OptStructStorage {
    data: ManyOpts? = null;
}
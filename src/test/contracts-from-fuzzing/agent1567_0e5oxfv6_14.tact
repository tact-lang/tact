contract MixedTypes {
    persistentInt: Int;
    persistentBool: Bool;
    persistentString: String;
    persistentCell: Cell;
    persistentSlice: Slice;
    persistentAddr: Address;
    persistentOptionalInt: Int?;
    persistentOptionalBool: Bool?;
    persistentOptionalString: String?;
    persistentOptionalCell: Cell?;
    persistentOptionalSlice: Slice?;
    persistentOptionalAddr: Address?;

    init() {
        self.persistentInt = 1;
        self.persistentBool = true;
        self.persistentString = "test";
        self.persistentCell = emptyCell();
        self.persistentSlice = emptyCell().asSlice();
        self.persistentAddr = myAddress();
        self.persistentOptionalInt = null;
        self.persistentOptionalBool = null;
        self.persistentOptionalString = null;
        self.persistentOptionalCell = null;
        self.persistentOptionalSlice = null;
        self.persistentOptionalAddr = null;
    }
}
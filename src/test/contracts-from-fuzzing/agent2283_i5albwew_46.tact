contract MultiTypeNullable {
    intVal: Int?;
    boolVal: Bool?;
    strVal: String?;
    addrVal: Address?;

    init() {
        self.intVal=null; self.boolVal=null; self.strVal=null; self.addrVal=null;
    }
}

contract OptionalFields {
    opt_int: Int?;
    opt_bool: Bool?;
    opt_cell: Cell?;
    opt_slice: Slice?;
    opt_addr: Address?;
    opt_str: String?;
    
    init() {
        self.opt_int = null;
        self.opt_bool = null;
        self.opt_cell = null;
        self.opt_slice = null;
        self.opt_addr = null;
        self.opt_str = null;
    }
}

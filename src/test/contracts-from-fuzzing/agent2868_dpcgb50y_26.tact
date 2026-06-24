contract OptionalSerializationConflict {
    i_opt_u32: Int? as uint32;
    
    init() {
        self.i_opt_u32 = -1; // Invalid for uint32, should produce error only after execution if enforced
    }
}
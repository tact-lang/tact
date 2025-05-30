contract OptionalSerialization {
    i_opt_u32: Int? as uint32; // optional Int serialized as uint32 optional
    
    init() {
        self.i_opt_u32 = null;
    }
}
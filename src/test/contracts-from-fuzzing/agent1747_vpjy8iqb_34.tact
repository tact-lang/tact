contract PersistentSliceOpt {
    maybeSlice: Slice?;
    
    init() {
        self.maybeSlice = null;
    }
}
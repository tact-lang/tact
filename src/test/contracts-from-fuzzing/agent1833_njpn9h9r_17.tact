contract TopLevelOptionalSerialized {
    smallNum: Int? as uint4;
    init() {
        self.smallNum = null;
    }
}

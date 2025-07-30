struct SliceStruct {
    s: Slice;
}

contract SliceFieldTest {
    sf: SliceStruct;

    init() {
        self.sf = SliceStruct{
            s: cell("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=").asSlice()
        };
    }
}
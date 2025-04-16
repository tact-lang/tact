contract StringRoundtripTest {
    receive() {
        // Testing round-trip conversion: String -> Slice -> String
        let s: String = "It's alive!";
        let s_slice: Slice = s.asSlice();
        let s2: String = s_slice.asString();
        dump(s2);
    }
}

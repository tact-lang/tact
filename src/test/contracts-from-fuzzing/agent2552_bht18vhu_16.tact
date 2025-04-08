struct MultiString {
    s1: String = "";
    s2: String = "short";
    s3: String = "A large test string padding the storage to examine serialization edge cases...............................................................";
}

contract StructWithManyStrings {
    strx: MultiString = MultiString{};
}
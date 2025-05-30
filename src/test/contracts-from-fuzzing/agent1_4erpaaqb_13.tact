fun testToString() {
    // Parse address from string and convert it back to string
    let community: Address = address("UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo");
    let s: String = community.toString();
    require(s != "", "Address.toString() returned empty result");
}

fun main() {
    testToString();
}

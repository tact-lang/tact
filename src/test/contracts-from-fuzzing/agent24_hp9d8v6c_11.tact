contract OnlyOptional(
    a: Int?,
    b: Bool?,
    c: String?,
    d: Address?,
) {
    receive() {
        let _ = 1; // dummy statement to make receive valid
    }
}
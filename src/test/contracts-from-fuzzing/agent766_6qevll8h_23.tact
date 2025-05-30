// contract params with many optional params
contract ParamsTest(
    x: Int?,
    y: Bool?,
    z: String?,
    q: Address?
) {
    // cannot use init here; all fields are params
}
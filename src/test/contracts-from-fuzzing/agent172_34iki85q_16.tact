contract ParameterStyleContract(
    count: Int as int16,
    enabled: Bool,
    label: String,
    description: String?,
    flag: Bool?,
    amount: Int as uint64,
    comment: String?
) {
    receive() {
        // reference to make sure params are stored properly
        require(self.count >= 0, "bad");
    }
}
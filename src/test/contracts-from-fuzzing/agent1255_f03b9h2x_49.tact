struct MaxBits {
    maxSigned: Int as int257;
    maxUnsigned: Int as uint256;
}

contract Test49 {
    data: MaxBits;

    init() {
        self.data = MaxBits{
            maxSigned: 0,
            maxUnsigned: 0,
        };
    }
}
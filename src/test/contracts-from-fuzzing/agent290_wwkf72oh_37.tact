const GLOBAL_CONST: Int = 42;

contract TestContract {
    const CONTRACT_CONST: Int = 100;

    x: Int = GLOBAL_CONST;
    y: Int = self.CONTRACT_CONST;
}

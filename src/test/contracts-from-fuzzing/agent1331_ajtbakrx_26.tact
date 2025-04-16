message TestMsg { y: Int }
contract MessageAsStorage {
    m: TestMsg = TestMsg{ y: 55 };
}
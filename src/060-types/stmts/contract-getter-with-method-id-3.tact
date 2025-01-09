primitive Int;
trait BaseTrait { }

contract ManualMethodId {
    const methodId: Int = 16384 + 41;
    get(self.methodId + 1) fun methodId(): Int {
        return self.methodId;
    }
}

primitive Int;
trait BaseTrait { }

const MethodId: Int = 16384;

contract Test {
    get(MethodId) fun test(): Int {
        return MethodId
    }
}

import "@stdlib/deploy";

trait BaseTrait { }

contract SampleTactContract {
    init() {
        toString(); // non-existent function
    }
}
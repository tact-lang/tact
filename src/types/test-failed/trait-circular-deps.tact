trait BaseTrait {}

trait A with B {}
trait B with A {}

contract Test with A {}

trait BaseTrait {}

trait A with B {}
trait B with C {}
trait C with D {}
trait D with A {}

contract Test with A {}

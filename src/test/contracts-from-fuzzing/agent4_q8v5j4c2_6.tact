trait FeeTrait {
    // Virtual constant for fee, default 1 Toncoin
    virtual const FEE: Int = ton("1");
}

trait DiscountTrait {
    // Virtual constant for discount, default 0
    virtual const DISCOUNT: Int = 0;
}

// CombinedTrait inherits from FeeTrait and DiscountTrait. Its methods have access to members from both traits.
trait CombinedTrait with FeeTrait, DiscountTrait {
    // Computes the effective charge: fee minus discount
    fun effectiveCharge(): Int {
        return self.FEE - self.DISCOUNT;
    }
}

contract Billing() with CombinedTrait {
    // Override virtual constants
    override const FEE: Int = 500;
    override const DISCOUNT: Int = 100;

    // Getter to expose the computed effective charge; expected: 500 - 100 = 400
    get fun charge(): Int {
        return self.effectiveCharge();
    }
}

// Expected behavior: Deploying Billing and calling the getter 'charge' should yield 400.
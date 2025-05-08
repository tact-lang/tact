trait TimedFeature {
    virtual const ENABLE: Bool = true;

    fun featureAction(): Int {
        if (self.ENABLE) {
            return 100;
        } else {
            return 0;
        }
    }
}

contract FeatureTest() with TimedFeature {
    override const ENABLE: Bool = false;

    get fun result(): Int {
        return self.featureAction();
    }
}

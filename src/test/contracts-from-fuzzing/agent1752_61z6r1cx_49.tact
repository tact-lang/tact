contract OptionalDefaultUnassigned {
    f: Int? = null;
}

// No init, relies on = null defaulting; expect compile success
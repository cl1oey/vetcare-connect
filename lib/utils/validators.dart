/// Validation utilities for profile form fields.
/// Return `null` if valid, or an error message if invalid.

String? validateFullName(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter your full name';
  }
  final trimmed = value.trim();
  if (trimmed.length < 3) {
    return 'Full name must be at least 3 characters';
  }
  if (RegExp(r'[0-9]').hasMatch(trimmed)) {
    return 'Full name cannot contain numbers';
  }
  return null;
}

String? validateContactNumber(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter your contact number';
  }
  final trimmed = value.trim();
  if (!RegExp(r'^[0-9+\-\s()]+$').hasMatch(trimmed)) {
    return 'Contact number contains invalid characters';
  }
  final digits = trimmed.replaceAll(RegExp(r'[^0-9]'), '');
  if (digits.isEmpty) {
    return 'Contact number must contain digits';
  }
  if (digits.length < 7) return 'Contact number is too short';
  if (digits.length > 15) return 'Contact number is too long';
  return null;
}

String? validateAddress(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter your address';
  }
  if (value.trim().length < 5) {
    return 'Address is too short';
  }
  return null;
}

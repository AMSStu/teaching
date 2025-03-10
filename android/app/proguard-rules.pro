# Proguard rules for your application

# Keep classes with @Keep annotation
-keep @interface androidx.annotation.Keep

# Keep Kotlin metadata for reflection
-keep class kotlin.metadata.** { *; }

# Keep all annotations used in the code
-keep @interface **.** { *; }

# Keep any class with this annotation
-keep @com.example.annotations.** class *

# Add additional rules based on your dependencies

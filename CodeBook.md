Data Dictionary for Getting and Cleaning Data Course Project

Variables included in final output of AvgReadings_by_Subj_Activity.txt are as follows. 
Note that all numbers represent the average (mean) of multiple mean and standard
deviation values that comprised the original, large dataset. Thus these are a summary
by Subject and Activity. The dataset is 180 rows by 68 columns representing 30 subjects
engaged in 6 different types of activities, and the resulting measurements.

To be clear, the first two columns identify the subject and the activity; the other
66 columns show the various "average mean" and "average standard deviation" measures.

Three blanket rules govern column names:
	a. prefix "mean" or "std" indicate whether the original value was a mean or standard
		deviation.
	b. suffix "_time" or "fft" pertains to whether the reading was a normal reading
		("_time") or whether a Fast Fourier Transform (FFT) was applied to the signal.
	c. "X","Y", and "Z" denote movement in the X-, Y-, and Z-planes.

For an explanation of what the actual measurements mean ("BodyAcc", "BodyBodyGyroWhatever",
what a time domain signal or a Fourier Fast Transform is etc.), please refer to the 
UCI_README.txt file which is from the data owners at UCI. I am an English major and this
may as well be in Greek, or perhaps Martian. I will do my best below.





1. Subject (int): ID number of subject (a human wearing a device), 1 - 30
2. Activity (chr): Activity engaged in by Subject while wearing device; options are
      Laying
      Sitting
      Standing
      Walking
      Walking Upward
      Walking Downward
      
The rest of the variables are all numeric, therefore I will cease specifying each.

3 - 5: meanBodyAcc(XYZ)_time: Average mean Body Acceleration in the X-, Y-, and Z-axes,
	 	time domain signal

6 - 8: stdBodyAcc(XYZ)_time: Avg std Body Acceleration in the X-, Y-, and Z-axes,
		time domain signal

9 - 11: meanGravityAcc(XYZ)_time: Avg mean Gravity Acceleration in the X-, Y-, and Z-axes,
		time domain signal

12 - 14: stdGravityAcc(XYZ)_time: Avg std Gravity Acceleration in the X-, Y-, and Z-axes,
		time domain signal

15 - 17: meanBodyAccJerk(XYZ)_time: Avg mean Body Jerk Acceleration in the X-, Y-, and
		Z-axes, time domain signal

18 - 20: stdBodyAccJerk(XYZ)_time: Avg std Body Jerk Acceleration in the X-, Y-, and
		Z-axes, time domain signal

21 - 23: meanBodyGyro(XYZ)_time: Avg mean Body Gyroscope readings in the X-, Y-, and
		Z-axes, time domain signal

24 - 26: stdBodyGyro(XYZ)_time: Avg std Body Gyroscope readings in the X-, Y-, and Z-axes,
		time domain signal
		
27 - 29: meanBodyGyroJerk(XYZ)_time: Avg mean Body Gyroscope Jerk readings in the X-, Y-,
		and Z- axes, time domain signal

30 - 32: stdBodyGyroJerk(XYZ)_time: Avg std Body Gyroscope Jerk readings in the X-, Y-,
		and Z-axes, time domain signal

33. meanBodyAccMag_time: Avg mean Body Acceleration Magnitude, time domain signal

34. stdBodyAccMag_time: Avg std Body Acceleration Magnitude, time domain signal

35. meanGravityAccMag_time: Avg mean Gravity Acceleration Magnitude, time domain signal

36. stdGravityAccMag_time: Avg std Gravity Acceleration Magnitude, time domain signal

37. meanBodyAccJerkMag_time: Avg mean Body Acceleration Jerk Magnitude, time domain signal

38. stdBodyAccJerkMag_time: Avg std Body Acceleration Jerk Magnitude, time domain signal

39. meanBodyGyroMag_time: Avg mean Body Gyroscope Magnitude, time domain signal

40. stdBodyGyroMag_time: Avg std Body Gyroscope Magnitude, time domain signal

41. meanBodyGyroJerkMag_time: Avg mean Body Gyroscope Jerk Magnitude, time domain signal

42. stdBodyGyroJerkMag_time: Avg std Body Gyroscope Jerk Magnitude, time domain signal

43 - 45: meanBodyAcc(XYZ)_fft: Avg mean Body Acceleration in the X-, Y-, and Z- axes, Fast 
		Fourier Transform (FFT)

46 - 48: stdBodyAcc(XYZ)_fft: Avg std Body Acceleration in the X-, Y-, and Z-axes, FFT

49 - 51: meanBodyAccJerk(XYZ)_fft: Avg mean Body Acceleration Jerk in the X-, Y-, and 
		Z-axes, FFT

52 - 54: stdBodyAccJerk(XYZ)_fft: Avg std Body Acceleration Jerk in the X-, Y-, and
		Z-axes, FFT
		
55 - 57: meanBodyGyro(XYZ)_fft: Avg mean Body Gyroscope in the X-, Y- and Z-axes, FFT

58 - 60: stdBodyGyro(XYZ)_fft: Avg std Body Gyroscope in the X-, Y-, and Z-axes, FFT

61. meanBodyAccMag_fft: Avg mean Body Acceleration Magnitude, FFT

62. stdBodyAccMag_fft: Avg std Body Acceleration Magnitude, FFT

63. meanBodyBodyAccJerkMag_fft: Avg mean Body-Body Acceleration Jerk Magnitude, FFT

64. stdBodyBodyAccJerkMag_fft: Avg std Body-Body Acceleration Jerk Magnitude, FFT

65. meanBodyBodyGyroMag_fft: Avg mean Body-Body Gyroscope Magnitude, FFT

66. stdBodyBodyGyroMag_fft: Avg std Body-Body Gyroscope Magnitude, FFT

67. meanBodyBodyGyroJerkMag_fft: Avg mean Body-Body Gyroscope Jerk Magnitude, FFT

68. stdBodyBodyGyroJerkMag_fft: Avg std Body-Body Gyroscope Jerk Magnitude, FFT
